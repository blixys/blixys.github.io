import os

# The exact line to remove
target_line = '<a href="https://github.com/blixys/blixys.github.io">View on GitHub</a>.'

# Walk through all files and subdirectories
for root, dirs, files in os.walk("."):  # "." means start from current folder
    for filename in files:
        if filename.endswith(".html"):
            path = os.path.join(root, filename)
            
            # Read the file contents
            with open(path, "r", encoding="utf-8") as f:
                lines = f.readlines()
            
            # Remove the exact line (strip newline for safety)
            new_lines = [line for line in lines if line.strip() != target_line]
            
            # If file changed, overwrite it
            if len(new_lines) != len(lines):
                with open(path, "w", encoding="utf-8") as f:
                    f.writelines(new_lines)
                print(f"Removed target line from: {path}")
