//
//  main.swift
//  calc
//
//  Created by Ryo on 2015/01/28.
//  Copyright (c) 2015年 Ryo. All rights reserved.
//

import Foundation


var test:[Int] = [Int](count:100, repeatedValue:0)
for i in 0...23 {
    for j in 0...59{
        test[((i*j)+(i+j))%100]++
    }
}

var sum:Int = 0
for i in 0...99{
    print(String(i)+" : ")
    println(test[i])
    sum += test[i]
}
println(sum)

