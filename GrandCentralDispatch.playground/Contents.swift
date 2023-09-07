import Dispatch
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


let queue = DispatchQueue(label: "my queue", attributes: .concurrent)
let group = DispatchGroup()
var flag: Bool = false

// called when all blocks associated with the
// dispatch group have completed.
group.notify(queue: .main) {
    print("done")
    flag = true
}

// dispatch asynchronous blocks
for idx in 0..<5 {
  queue.async(group: group) {
    print(idx)
  }
}

for idx in 5..<10 {
  queue.async(group: group) {
    print(idx)
  }
}

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    if flag {
        for idx in 10..<20 {
            queue.async(group: group) {
                print(idx)
            }
        }
    }
}
