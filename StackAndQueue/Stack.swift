//
//  Stack.swift
//  StackAndQueue
//
//  Created by Alireza Karimi on 2023-07-21.
//

import Foundation

// Define the Node class for the linked list
private class Node<E> {
    let value: E
    var next: Node<E>?

    init(value: E) {
        self.value = value
    }
}

// Define the Stack class
public final class Stack<E>: Sequence {
    private var top: Node<E>?
    private(set) var count: Int = 0

    // Initializes an empty stack
    public init() { }

    // Pushes an item onto the stack
    public func push(item: E) {
        let newNode = Node(value: item)
        newNode.next = top
        top = newNode
        count += 1
    }

    // Pops the most recently added item from the stack and returns it
    public func pop() -> E? {
        guard let currentTop = top else { return nil }

        top = currentTop.next
        count -= 1

        return currentTop.value
    }

    // Returns (but does not remove) the item most recently added to the stack
    public func peek() -> E? {
        return top?.value
    }

    // Checks if the stack is empty
    public func isEmpty() -> Bool {
        return top == nil
    }

    // Returns an iterator for the stack
    public func makeIterator() -> StackIterator<E> {
        return StackIterator<E>(top: top)
    }
}

// Define the iterator for the Stack
public struct StackIterator<E>: IteratorProtocol {
    private var current: Node<E>?

    fileprivate init(top: Node<E>?) {
        current = top
    }

    public mutating func next() -> E? {
        guard let currentNode = current else { return nil }
        current = currentNode.next
        return currentNode.value
    }
}

