"""测试 tree-sitter 多语言符号提取。"""
from kit.tree_sitter_symbol_extractor import TreeSitterSymbolExtractor

# 测试 TypeScript
ts_code = """
export interface User {
    name: string;
    age: number;
}

export class UserService {
    private users: User[] = [];
    
    addUser(user: User): void {
        this.users.push(user);
    }
    
    getUser(name: string): User | undefined {
        return this.users.find(u => u.name === name);
    }
}

export function createUser(name: string, age: number): User {
    return { name, age };
}
"""

symbols = TreeSitterSymbolExtractor.extract_symbols('.ts', ts_code)
print('=== TypeScript ===')
for s in symbols:
    print(f"  {s.get('type', '?'):20s} {s.get('name', '?')}  (line {s.get('start_line', '?')}-{s.get('end_line', '?')})")

# 测试 Java
java_code = """
public class Calculator {
    private int result;
    
    public Calculator() {
        this.result = 0;
    }
    
    public int add(int a, int b) {
        return a + b;
    }
    
    public static void main(String[] args) {
        Calculator calc = new Calculator();
        System.out.println(calc.add(1, 2));
    }
}
"""

symbols = TreeSitterSymbolExtractor.extract_symbols('.java', java_code)
print('\n=== Java ===')
for s in symbols:
    print(f"  {s.get('type', '?'):20s} {s.get('name', '?')}  (line {s.get('start_line', '?')}-{s.get('end_line', '?')})")

# 测试 C++
cpp_code = """
#include <iostream>
#include <vector>

class Matrix {
private:
    std::vector<std::vector<double>> data;
    int rows, cols;
    
public:
    Matrix(int r, int c) : rows(r), cols(c) {
        data.resize(r, std::vector<double>(c, 0.0));
    }
    
    double get(int r, int c) const {
        return data[r][c];
    }
    
    void set(int r, int c, double val) {
        data[r][c] = val;
    }
};

int main() {
    Matrix m(3, 3);
    m.set(0, 0, 1.0);
    return 0;
}
"""

symbols = TreeSitterSymbolExtractor.extract_symbols('.cpp', cpp_code)
print('\n=== C++ ===')
for s in symbols:
    print(f"  {s.get('type', '?'):20s} {s.get('name', '?')}  (line {s.get('start_line', '?')}-{s.get('end_line', '?')})")

# 测试 C
c_code = """
#include <stdio.h>

struct Point {
    int x;
    int y;
};

int add(int a, int b) {
    return a + b;
}

int main() {
    struct Point p = {1, 2};
    printf("%d\n", add(p.x, p.y));
    return 0;
}
"""

symbols = TreeSitterSymbolExtractor.extract_symbols('.c', c_code)
print('\n=== C ===')
for s in symbols:
    print(f"  {s.get('type', '?'):20s} {s.get('name', '?')}  (line {s.get('start_line', '?')}-{s.get('end_line', '?')})")

# 测试 Go
go_code = """
package main

import "fmt"

type Person struct {
    Name string
    Age  int
}

func (p Person) Greet() string {
    return fmt.Sprintf("Hi, I'm %s, %d years old", p.Name, p.Age)
}

func NewPerson(name string, age int) Person {
    return Person{Name: name, Age: age}
}

func main() {
    p := NewPerson("Alice", 30)
    fmt.Println(p.Greet())
}
"""

symbols = TreeSitterSymbolExtractor.extract_symbols('.go', go_code)
print('\n=== Go ===')
for s in symbols:
    print(f"  {s.get('type', '?'):20s} {s.get('name', '?')}  (line {s.get('start_line', '?')}-{s.get('end_line', '?')})")
