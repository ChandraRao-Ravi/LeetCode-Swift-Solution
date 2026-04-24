import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var firstElement = ListNode(0)
        var currentElement = firstElement
        var carryForward = 0
        var listNode1 = l1, listNode2 = l2
        
        while listNode1 != nil || listNode2 != nil || carryForward != 0 {
            let v1 = listNode1?.val ?? 0
            let v2 = listNode2?.val ?? 0
            let sum = v1 + v2 + carryForward
            carryForward = sum / 10
            currentElement.next = ListNode(sum % 10)
            currentElement = currentElement.next!
            listNode1 = listNode1?.next
            listNode2 = listNode2?.next
        }
        return firstElement.next
    }
}

// ##For Running in Playground

// Helper to create list from array (reversed)
func createList(from array: [Int]) -> ListNode? {
    var head: ListNode?
    var tail: ListNode?
    for val in array {
        let node = ListNode(val)
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
    }
    return head
}

// Helper to print list
func printList(_ head: ListNode?) {
    var current = head
    var values: [Int] = []
    while current != nil {
        values.append(current!.val)
        current = current?.next
    }
    print("Result: \(values)")
}

// Test
let l1Array = [2,4,3]  // 342
let l2Array = [5,6,4]  // 465
let l1 = createList(from: l1Array)
let l2 = createList(from: l2Array)

let solution = Solution()
let result = solution.addTwoNumbers(l1, l2)

printList(result)
