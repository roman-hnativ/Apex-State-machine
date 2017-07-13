public class ProcessContext {

	private Process.State myState;
	private Case caseObj;

	public ProcessContext(Case mCase)
	{
		caseObj = mcase;

		if (String.isEmpty(caseObj.Status))
		{
			SetState(new Process.EmptyState());			
		} else if (caseObj.Status == Const.CASE_STATUS_PROCESS_STEP_1)
		{
			SetState(new Process.State1());
		} else if (caseObj.Status == Const.CASE_STATUS_PROCESS_STEP_2)
		{
			SetState(new Process.State2());
		} else if (caseObj.Status == Const.CASE_STATUS_PROCESS_STEP_3) 
		{
			SetState(new Process.State3());
		} else {
			throw new BusinessProcess.BusinessProcessException('Process is not supported');
		}
	}

	public void SetState(Process.State mutationState)
	{
		myState = mutationState;
	}

	public void Process()
	{
		while (myState != null)
		{
			myState.Process(this, caseObj);
		}
	}
}
