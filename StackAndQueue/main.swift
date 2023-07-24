//
//  main.swift
//  StackAndQueue
//
//  Created by Alireza Karimi on 2023-07-21.
//

import Foundation

func mainStack() {
    var myStack = Stack<Int>()

    myStack.push(item: 10)
    myStack.push(item: 20)
    myStack.push(item: 30)

    print("Count:", myStack.count) // Output: Count: 3

    if let poppedItem = myStack.pop() {
        print("Popped item:", poppedItem) // Output: Popped item: 30
    }

    print("Peek:", myStack.peek() ?? "Stack is empty") // Output: Peek: 20

    print("Is empty:", myStack.isEmpty()) // Output: Is empty: false

    for item in myStack {
        print("Item:", item) // Output: Item: 20, Item: 10
    }
}

//mainStack()
//////////////////////////////////////////////////////////////////////////////////////////////////////

func mainQueue() {
    var myQueue = Queue<Int>()

    myQueue.enqueue(item: 10)
    myQueue.enqueue(item: 20)
    myQueue.enqueue(item: 30)

    print("Count:", myQueue.count) // Output: Count: 3

    if let dequeuedItem = myQueue.dequeue() {
        print("Dequeued item:", dequeuedItem) // Output: Dequeued item: 10
    }

    print("Peek:", myQueue.peek() ?? "Queue is empty") // Output: Peek: 20

    print("Is empty:", myQueue.isEmpty()) // Output: Is empty: false

    for item in myQueue {
        print("Item:", item) // Output: Item: 20, Item: 30
    }
}

//mainQueue()
