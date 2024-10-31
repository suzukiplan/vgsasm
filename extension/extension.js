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
    console.log("search: struct " + name);
    /* 以下、激重
    const regex = new RegExp("\\-istruct *name");
    const matches = regex.exec(document.getText());
    if (matches != null) {
        console.log("matched: ", matches);
    }
    */
    const list = [];
    list.push({ label: 'foo', kind: vscode.CompletionItemKind.Field });
    list.push({ label: 'hoge', kind: vscode.CompletionItemKind.Field });
    list.push({ label: 'hige', kind: vscode.CompletionItemKind.Field });
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
