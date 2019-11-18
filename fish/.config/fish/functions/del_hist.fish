function del_hist
    eval history delete --exact --case-sensitive  $history[1]
end
