# kinds

[![Build Status](https://github.com/wtfo-guru/kinds/workflows/test/badge.svg?branch=master&event=push)](https://github.com/wtfo-guru/kinds/actions?query=workflow%3Atest)
[![codecov](https://codecov.io/gh/wtfo-guru/kinds/branch/master/graph/badge.svg)](https://codecov.io/gh/wtfo-guru/kinds)
[![Python Version](https://img.shields.io/pypi/pyversions/kinds.svg)](https://pypi.org/project/kinds/)
[![wemake-python-styleguide](https://img.shields.io/badge/style-wemake-000000.svg)](https://github.com/wemake-services/wemake-python-styleguide)

Project to help with typing in multi-version python projects. I have recently started to use poetry and modern python best practices for my work. I am struggling with typing that supports python >= 3.9 versus python <= python 3.8. I am using this small project for experimentation and help with this obstacle.


## Features

- Fully typed with annotations and checked with mypy, [PEP561 compatible](https://www.python.org/dev/peps/pep-0561/)
- Add yours!


## Installation

```bash
pip install kinds
```


## Example

Showcase how your project can be used:

```python
from kinds.example import some_function

print(some_function(3, 4))
# => 7
```

## License

[MIT](https://github.com/wtfo-guru/kinds/blob/master/LICENSE)


## Credits

This project was generated with [`wemake-python-package`](https://github.com/wemake-services/wemake-python-package). Current template version is: [3d9ad64bcbf7afc6bee7f2c9ea8c923d579b119c](https://github.com/wemake-services/wemake-python-package/tree/3d9ad64bcbf7afc6bee7f2c9ea8c923d579b119c). See what is [updated](https://github.com/wemake-services/wemake-python-package/compare/3d9ad64bcbf7afc6bee7f2c9ea8c923d579b119c...master) since then.
