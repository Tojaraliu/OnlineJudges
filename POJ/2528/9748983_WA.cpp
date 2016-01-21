#include<cstdio>
#include<algorithm>
#include<string.h>
#define MAX 20001
using std::sort;
 
int c,n,ls[MAX];
struct node
{
    int l, r;
    int c;
}tree[MAX*4];
struct ln
{
    int li, num; // num琛ㄧず绗嚑寮犳捣鎶?
}line[MAX];
 
int set[MAX][2];
bool visit[MAX]; // 璁块棶鏍囧織锛屽垵濮嬩负false
int ans;
bool cmp(struct ln a, struct ln b)
{
    return a.li < b.li;
}
void Inittree(int pos, int ll, int rr)
{
    tree[pos].l = ll;
    tree[pos].r = rr;
    tree[pos].c = 0;
    if(ll != rr)
    {
        int mid = (ll+rr) >> 1;
        Inittree(pos*2, ll, mid);
        Inittree(pos*2+1, mid+1, rr);
    }
}
void Insert(int pos, int ll, int rr, int color)
{
    if(tree[pos].l == ll && tree[pos].r == rr)
    {
        tree[pos].c = color;
        return;
    }
    if(tree[pos].c > 0 && tree[pos].c != color)
    {
        tree[pos*2].c = tree[pos].c;
        tree[pos*2+1].c = tree[pos].c;
        tree[pos].c = 0; // 姝ゅ寮犺创澶氬紶娴锋姤
    }
    int mid = (tree[pos].l + tree[pos].r) >> 1;
    if(rr <= mid)
        Insert(pos*2, ll, rr, color);
    else if(ll > mid)
        Insert(pos*2+1, ll, rr, color);
    else
    {
        Insert(pos*2, ll, mid, color);
        Insert(pos*2+1, mid+1, rr, color);
    }
}
 
void Search(int pos)
{
    if(tree[pos].c != 0)
    {
        if(!visit[tree[pos].c])
        {
            visit[tree[pos].c] = true;
            ans++;
        } // 鍙鍑虹幇杩囩殑娴锋姤璁板綍涓€娆?
        return;
    }
    Search(2*pos);
    Search(2*pos+1);
}
 
int main()
{
    int i;
    scanf("%d", &c);
    while(c--)
    {
        scanf("%d", &n);
        for(i = 0; i < n; i++)
        {
            scanf("%d%d", &set[i][0], &set[i][1]);
            line[2*i].li = set[i][0];
            line[2*i].num = -i; // 鐢ㄨ礋鏁拌〃绀虹嚎娈佃捣鐐?
            line[2*i+1].li = set[i][1];
            line[2*i+1].num = i; // 鐢ㄦ鏁拌〃绀虹嚎娈电粓鐐?
        }
        for(i=0;i<2*n;i++)
        {
          printf("%d ",line[i].li);
        }
        printf("\n");
        sort(line, line+2*n, cmp);
        for(i=0;i<2*n;i++)
        {
          printf("%d ",line[i].li);
        }
        printf("\n");
        int temp = line[0].li, tp = 1;
        for(i = 0; i < 2*n; i++)
        {
            if(line[i].li != temp) // 缁熻涓嶉噸鍙犵偣鐨勪釜鏁皌p
            {
                tp++;
                temp = line[i].li;
            }
            if(line[i].num < 0)
                set[-line[i].num][0] = tp;
            else
                set[line[i].num][1] = tp;
            // 灏嗘墍鏈夌偣璧嬩簣绂绘暎鍖栧悗鐨勮繛缁€硷紱姝ゅ鏃犻渶璁板綍鍘熷璺濈锛屾晠瑕嗙洊鏂版爣璁板嵆鍙?
        } // 绂绘暎鍖栧鐞嗗畬鎴?
        for(i=0;i<n;i++)
        {
          printf("%d %d\n",set[i][0],set[i][1]);
        }
        Inittree(1, 1, tp);
        for(i = 0; i < n; i++)
            Insert(1, set[i][0], set[i][1], i+1);
        memset(visit, 0, sizeof(visit));
        ans = 0;
        Search(1);
        
        printf("%d\n", ans);
    }   
    system("pause");
    return 0;
}
