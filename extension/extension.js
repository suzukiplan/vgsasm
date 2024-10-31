const vscode = require('vscode');
const VGSASM_MODE = { scheme: 'file', language: 'vgsasm' };

function helloWorld() {
    vscode.window.showInformationMessage('Hello, world!')
}

function getStructMemberList(name, document, position) {
    if (!name.endsWith('.')) { return; }
    const token = name.split(/[ .,()]/);
    if (token.length < 2) { return; }
    name = token[token.length - 2];
    const regex = new RegExp('struct\\s+' + name, 'i');
    let source = document.getText();
    const structPosition = source.search(regex);
    if (-1 == structPosition) { return; }
    const beginPosition = source.indexOf('{', structPosition);
    if (-1 == beginPosition) { return; }
    const endPosition = source.indexOf('}', beginPosition);
    if (-1 == endPosition) { return; }
    const structDefinition = source.substr(beginPosition, endPosition - beginPosition + 1);
    const lines = structDefinition.split('\n');
    const list = [];
    for (var i = 1; i < lines.length - 1; i++) {
        const line = lines[i].trim();
        const token = line.split(/[ \t]/);
        if (3 <= token.length) {
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
            list.push({ label: token[0], kind: vscode.CompletionItemKind.Field, detail: detail });
        }
    }
    return list;
}

class VGSMethodCompletionItemProvider {
    provideCompletionItems(document, position, token) {
        const structName = document.lineAt(position).text.substr(0, position.character);
        const completionItems = getStructMemberList(structName, document);
        let completionList = new vscode.CompletionList(completionItems, false);
        return Promise.resolve(completionList);
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
