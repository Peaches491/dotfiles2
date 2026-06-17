(
git worktree list | grep -v '(bare)' | while read -r path branch hash; do
    # Find the most recent file and its stats (timestamp, human-readable time, path)
    latest_stat=$(find "$path" -not -path "*/.git/*" -type f -printf "%T@\t%Tc\t%p\n" 2>/dev/null | sort -nr | head -n 1)

    if [ -z "$latest_stat" ]; then
        # Handle worktrees with no files
        printf "0\t1970-01-01 00:00:00\t%s %s\t(No files found)\n" "$path" "$branch"
    else
        # Print the timestamp (for sorting) and the formatted info
        timestamp=$(echo "$latest_stat" | cut -f1)
        human_time=$(echo "$latest_stat" | cut -f2)
        filepath=$(echo "$latest_stat" | cut -f3)
        printf "%.0f\t%s\t%s %s\tLast File: %s\n" "$timestamp" "$human_time" "$path" "$branch" "$filepath"
    fi
done
) | sort -nr | cut -f2-
