//
//  Queue.swift
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

// Define the Queue class
public final class Queue<E>: Sequence {
    private var front: Node<E>?
    private var rear: Node<E>?
    private(set) var count: Int = 0

    // Initializes an empty queue
    public init() { }

    // Adds an item to the rear of the queue
    public func enqueue(item: E) {
        let newNode = Node(value: item)

        if rear == nil {
            front = newNode
            rear = newNode
        } else {
            rear?.next = newNode
            rear = newNode
        }

        count += 1
    }

    // Removes and returns the item at the front of the queue
    public func dequeue() -> E? {
        guard let currentFront = front else { return nil }

        front = currentFront.next
        if front == nil {
            rear = nil
        }

        count -= 1
        return currentFront.value
    }

    // Returns (but does not remove) the item at the front of the queue
    public func peek() -> E? {
        return front?.value
    }

    // Checks if the queue is empty
    public func isEmpty() -> Bool {
        return front == nil
    }

    // Returns an iterator for the queue
    public func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(front: front)
    }
}

// Define the iterator for the Queue
public struct QueueIterator<E>: IteratorProtocol {
    private var current: Node<E>?

    fileprivate init(front: Node<E>?) {
        current = front
    }

    public mutating func next() -> E? {
        guard let currentNode = current else { return nil }
        current = currentNode.next
        return currentNode.value
    }
}
