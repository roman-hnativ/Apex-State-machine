# Apex-State-machine

My implementation of State Pattern (https://en.wikipedia.org/wiki/State_pattern) in apex.

Example:

ProcessContext  cntxt = new ProcessContext (caseItem);
cntxt.Process();

//update is always called outside of state machine
update caseItem;


