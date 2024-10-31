const vscode = require('vscode');
const VGSASM_MODE = { scheme: 'file', language: 'vgsasm' };

function helloWorld() {
    vscode.window.showInformationMessage('Hello, world!')
}

function getStructMemberList(name, document) {
    return new Promise((resolve) => {
        if (!name.endsWith('.')) {
            resolve();
            return;
        }
        const token = name.split(/[ .,()]/);
        if (token.length < 2) {
            resolve();
            return;
        }
        name = token[token.length - 2];
        const regex = new RegExp('struct\\s+' + name, 'i');
        let source = document.getText();
        getMemberListR({ type: "struct", regex: regex }, source, document, [], resolve);
    });
}

function getMemberListR(config, source, document, documentList, resolve) {
    for (var i = 0; i < documentList.length; i++) {
        if (documentList[i] == document.uri.path) {
            console.log("ignored dup: " + document.uri.path);
            resolve();
            return;
        }
    }
    documentList.push(document.uri.path);
    const structPosition = source.search(config.regex);
    if (-1 == structPosition) {
        const uriEndPos = document.uri.path.lastIndexOf('/');
        if (-1 == uriEndPos) {
            resolve();
            return;
        }
        const basePath = document.uri.path.substr(0, uriEndPos + 1);
        const lines = source.split('\n');
        var count = 0;
        for (var i = 0; i < lines.length; i++) {
            if (lines[i].startsWith('#include')) {
                const tokens = lines[i].split(/[ \t]/);
                for (var j = 0; j < tokens.length; j++) {
                    if (tokens[j].startsWith('"') && tokens[j].endsWith('"')) {
                        count++;
                        const uri = document.uri.with({ path: basePath + tokens[j].substr(1, tokens[j].length - 2) });
                        vscode.workspace.openTextDocument(uri).then((includeDocument) => {
                            const includeSource = includeDocument.getText();
                            return getMemberListR(config, includeSource, includeDocument, documentList, resolve);
                        });
                    }
                }
            }
        }
        if (0 == count) {
            resolve();
        }
        return;
    }
    const beginPosition = source.indexOf('{', structPosition);
    if (-1 == beginPosition) {
        resolve();
        return;
    }
    const endPosition = source.indexOf('}', beginPosition);
    if (-1 == endPosition) {
        resolve();
        return;
    }
    const structDefinition = source.substr(beginPosition, endPosition - beginPosition + 1);
    const lines = structDefinition.split('\n');
    const list = [];
    for (var i = 1; i < lines.length - 1; i++) {
        const line = lines[i].trim();
        var detail = undefined;
        const commentPos = line.indexOf(';');
        if (-1 != commentPos) {
            detail = line.substr(commentPos + 1).trim();
        } else {
            commentPos = line.indexOf('//');
            if (-1 != commentPos) {
                detail = line.substr(commentPos + 2).trim();
            }
        }
        const token = line.split(/[ \t]/);
        if (3 <= token.length && config.type == "struct") {
            list.push({ label: token[0], kind: vscode.CompletionItemKind.Field, detail: detail });
        }
    }
    return resolve(new vscode.CompletionList(list, false));
}

class VGSMethodCompletionItemProvider {
    provideCompletionItems(document, position, token) {
        const structName = document.lineAt(position).text.substr(0, position.character);
        return getStructMemberList(structName, document);
    }
}

function activate(context) {
    context.subscriptions.push(vscode.commands.registerCommand('vgsasm.helloWorld', helloWorld));
    context.subscriptions.push(vscode.languages.registerCompletionItemProvider(VGSASM_MODE, new VGSMethodCompletionItemProvider(), '.'));
}

function deactivate() {
    return undefined;
}

module.exports = { activate, deactivate };
