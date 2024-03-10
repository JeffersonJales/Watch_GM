# Watch_GM
Another alarm alternative for Game Maker

Function Index
## Watches
- `watch_alarm`: Creates a new watch that returns true when finishes. Returns a WatchAlarmClass struct.
- `watch_callback`: Creates a new watch that will execute a function when finishes. Returns a WatchCallbackClass struct.

With an optional argument for this two functions you can tell if this clock is global or not.
Case a watch is on global scope, it can be manipulated: 
## Global Watches

- `watch_global_resume` - Resume all watches in global scope
- `watch_global_pause` - Pause all watches in global scope
- `watch_global_kill` - Kill all watches in global scope
- `watch_global_step` - Run all watches in global scope

### Global Watch - Add and Remove watches from Global Scope
  
- `watch_global_add` - Adds a watch struct to the global scope
- `watch_global_remove` - Removes a watch from the global scope
- `watch_global_clear` - Remove all watches from the global scope

