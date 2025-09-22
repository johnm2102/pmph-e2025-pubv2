def simulate_warpid(block_size=1024, warp_size=32): 
    lg_warp = 5 
    print("Thread ID | Warp ID | Lane ID")
    print("-----------------------------")

    for idx in range(block_size+1): 
        warpid = idx >> lg_warp
        laneid = idx & (warp_size - 1)
        print(f"{idx:9d} | {warpid:7d} | {laneid:2d}")
        if idx % 32 == 31:
            print("         ...         ")
simulate_warpid()