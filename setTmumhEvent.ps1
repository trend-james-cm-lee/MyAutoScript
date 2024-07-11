$eventName = "TmumhEvent"

do {
    $eventOpened = $false
    try {
        $mgrReadyEvent = [System.Threading.EventWaitHandle]::OpenExisting($eventName)
        $eventOpened = $true
    } catch {
        Start-Sleep -Seconds 1
    }
} while (-not $eventOpened)

$mgrReadyEvent.Set()

$mgrReadyEvent.Dispose()