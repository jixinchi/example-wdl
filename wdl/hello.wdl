version 1.0

import "tasks/task.wdl" as t

workflow test {
    input {
        String name1
        String name2
        File request
    }

    call t.hello as step1 {
        input: name = name1, request = request
    }

    call t.hello as step21 {
        input: name = name2, request = step1.response
    }

    call t.hello as step22 {
        input: name = name2, request = step1.response
    }

    output {
        String resp = "abc"
        File response1 = step21.response
        File response2 = step22.response
    }
}

