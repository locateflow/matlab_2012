d = diff(A);
filtered = (d(d>0));
filtered = (filtered(filtered<30));
figure

filtered = (filtered-mean(filtered))/(std(filtered).^2);
h = hist(filtered,200);
plot((h(h~=0)-mean(h))/std(h))
%%
d = diff(B);
filtered = (d(d>0));
filtered = (filtered(filtered<30));
% figure
hold on

filtered = (filtered-mean(filtered))/std(filtered);
h = hist(filtered,200);
plot((h(h~=0)-mean(h))/std(h),'r')
%%
d = diff(C);
filtered = (d(d>0));
filtered = (filtered(filtered<30));
% figure

filtered = (filtered-mean(filtered))/std(filtered);
h = hist(filtered,200);
plot((h(h~=0)-mean(h))/std(h),'g')
%%
d = diff(D);
filtered = (d(d>0));
filtered = (filtered(filtered<30));
% figure
filtered = (filtered-mean(filtered))/std(filtered);
h = hist(filtered,200);
plot((h(h~=0)-mean(h))/std(h),':')
%%
d = diff(E);
filtered = (d(d>0));
filtered = (filtered(filtered<30));
% figure

filtered = (filtered-mean(filtered))/std(filtered);
h = hist(filtered,200);
plot((h(h~=0)-mean(h))/std(h),'--')
%%
d = diff(F);
filtered = (d(d>0));
filtered = (filtered(filtered<30));
% figure

filtered = (filtered-mean(filtered))/std(filtered);
h = hist(filtered,200);
plot((h(h~=0)-mean(h))/std(h),'.-')
%%
save '2012/05/2012_05_10/May_10_2012'
