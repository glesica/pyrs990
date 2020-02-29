help:
	@echo analyze    - run the type checker
	@echo check      - run tests
	@echo check-fast - run non-network, non-subprocess tests
	@echo format     - format the code

analyze:
	poetry run mypy . tests/

check:
	poetry run pytest

check-fast:
	poetry run pytest -m "not network and not subprocess"

format:
	poetry run isort --recursive --use-parentheses --trailing-comma -y -w 80
	poetry run autoflake -r --in-place --remove-unused-variables .
	poetry run black -t py38 -l 80 .

format-check:
	poetry run black -t py38 -l 80 --check .
