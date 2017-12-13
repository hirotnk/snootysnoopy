-module(misc).
-compie(export_all).

%% https://en.wikipedia.org/wiki/Partition_(number_theory)
partition(N) -> partition(N,N).

partition(_N,1) -> 1;
partition(0,_N) -> 1;
partition(N,_) when N < 0 -> 0;
partition(N,K) -> partition(N-K,K) + partition(N,K-1).

