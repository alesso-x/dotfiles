function hist_delete
    history delete --exact --case-sensitive  $history[1]
    history delete --exact --case-sensitive "hist_delete"
end
