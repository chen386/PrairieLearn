UPDATE
    workspace_hosts AS wh
SET
    state = 'unhealthy',
    state_changed_at = NOW(),
    unhealthy_at = NOW()
WHERE
    $confirm = 'yes'
    AND wh.state IN ('launching', 'ready', 'draining')
RETURNING
    wh.id AS workspace_host_id,
    wh.instance_id,
    wh.state,
    wh.unhealthy_at;
