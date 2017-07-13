public class Process {

	public interface State {

		void Process(ProcessContext pContext, Case caseObj);

	}

	public class EmptyState implements Process.State
	{
		public void Process(ProcessContext pContext, Case caseObj)
		{			
			pContext.setState(null);

			Account acc = [select id, name,IsPersonAccount from account where id=:caseObj.accountid ];

			
			if (acc.IsPersonAccount) {
			
				if (someCondition(acc)) {
					caseObj.CustomField1__c = true;
					return;
				}


				if (otherCondition(caseObj)) {
					
					caseObj.Extra_Status__c = Const.STATUS_SUCCESSFUL_SYNC;					
					pContext.SetState(new State1());
					return;
				}

				pContext.setState(new State2());
			}
			
		}

		private Boolean someCondition(Account acc) {
			return true;
		}
		
		private Boolean otherCondition(Case caseObj) {
			return true;
		}
	}


	public class State1 implements Process.State
	{
		public void Process(ProcessContext pContext, Case caseObj)
		{
			pContext.setState(null);

			if (true)
			{
				pContext.setState(new State2());
			}
		}
	}

	public class State2 implements Process.State
	{
		public void Process(ProcessContext pContext, Case caseObj)
		{
			//do some work
			
			pContext.setState(new State3());
		}
	}

	public class State3 implements Process.State
	{
		public void Process(ProcessContext pContext, Case caseObj)
		{
			pContext.setState(null);

			//other field updates 
		}
	}

	
}
