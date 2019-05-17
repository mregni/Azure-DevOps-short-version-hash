const simpleGit = require('simple-git')();
import tl = require('azure-pipelines-task-lib/task');

async function run() {
    try {
        simpleGit.revparse(["--short", "HEAD"], (err, result) => {
            if(err === null) {
                console.log("Short git version found! => " + result)
                console.log("##vso[task.setvariable variable=ShortVersionHash]" + result);
                tl.setResult(tl.TaskResult.Succeeded, "");
            }
            else {
                tl.setResult(tl.TaskResult.Failed, err);
            }
            
        })
    }
    catch (err) {
        tl.setResult(tl.TaskResult.Failed, err.message);
    }
}

run();