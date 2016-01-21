#include<iostream>
#include<fstream>
#include<queue>

using namespace std;

struct e{
	int data;
	e *next;
	int c,f;
	e *op;
};

e edge[500];

int d[500];

int start,end;
int n,m;

int build(){
	int i,j,k;
	
	queue<int> q;
	memset(d,0,sizeof(d));
	d[0]=1;
	q.push(start);
	while(!q.empty())
	{
		i=q.front();	
		q.pop();
		e *p=edge[i].next;
		while(p)
		{
			if(d[p->data]==0&&p->c>p->f)
			{
				d[p->data]=d[i]+1;
				if(p->data==end) return 1;
				q.push(p->data);
			}
			p=p->next;
		}
	}
	return 0;
}

int dfs(int s,int minn){
	int i,j,k;
	if(s==end) return minn;
	j=minn;
	e *p=edge[s].next;
	while(p){
		if(p->c>p->f&&d[p->data]==d[s]+1)
		{
			
			k=dfs(p->data,min(minn,p->c-p->f));
			if(k>0)
			{
				p->f+=k;
				p->op->f=-1*p->f;
				return k;
			}
		}
		
		p=p->next;
	}
	return 0;
}

int dinic(){
	int i,j,k;
	int flow=0;
	while(build())
	{
		while(k=dfs(start,100000000))
		{
			flow+=k;
		}
	}
	return flow;
}

char c[500][30];
char c1[30],c2[30];


int getnum(char s[]){
	int i;
	for(i=1;i<=n;i++)
		if(strcmp(s,c[i])==0)
		{
			return i;
		}
	return -1;
}

void add(int s,int t,int value){
	e *p=new e;
	p->data=t;
	p->f=0;
	p->c=value;
	p->next=edge[s].next;
	edge[s].next=p;

	e *q=new e;
	q->data=s;
	q->f=q->c=0;
	q->next=edge[t].next;
	edge[t].next=q;
	
	q->op=p;
	p->op=q;
}

void read(){
//	ifstream cin("in.txt");
	int i,j,k,s,t;
	start=0;end=1;
	cin>>n;
	for(i=1;i<=n;i++)
	{
		cin>>c[i];
		add(0,i+1,1);
	}
	cin>>m;
	for(i=1;i<=m;i++)
	{
		cin>>c1>>c2;
		j=getnum(c2);
		if(j==-1)
		{
			++n;
			strcpy(c[n],c2);
			add(n+1,1,1);
		}
		else
			add(j+1,1,1);
	}
	cin>>k;
	for(i=1;i<=k;i++)
	{
		cin>>c1>>c2;
		s=getnum(c1);
		t=getnum(c2);
		if(s==-1)
		{
			n++;
			strcpy(c[n],c1);
			s=n;
		}
		if(t==-1)
		{
			n++;
			strcpy(c[n],c2);
			t=n;
		}
		add(t+1,s+1,10000000);
	}
	cout<<m-dinic()<<endl;

}

int main(){
	read();
	//system("pause");
	return 0;
}
