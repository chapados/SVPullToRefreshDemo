# SVPullToRefreshDemo

A simple project demonstrating the basic use of SVPullToRefresh.

This project embeds a UITableViewController in a navigation heirarchy.
Tapping any row in a table pushes a new instance of the UITableViewController.
This setup a leaking tableView key-value observer.

## Steps to reproduce the bug

1. Tap any cell to load a new table view controller.
2. Tap back to return to the root view controller.

See discussion here: 
https://github.com/samvermette/SVPullToRefresh/pull/13
