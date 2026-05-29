"""测试签名提取。"""
import sys
sys.path.insert(0, 'D:/project/kit')
from generate_preview import get_full_signature, parse_python_details
from kit import Repository
from pathlib import Path

repo = Repository('D:/project/kit/kit')
source = repo.get_file_content('src/kit/code_searcher.py')
details = parse_python_details('src/kit/code_searcher.py', source)

for class_name, info in details['classes'].items():
    if class_name == 'CodeSearcher':
        for method_name, method_info in info['methods'].items():
            print(f'{method_name}: {method_info["signature"]}')
