# Command Line Todo List 1.0

## Summary
We're going to build a todo list application.  We're going to build our application feature-by-feature.  We'll start by displaying a list of items and proceed step-by-step until we've added all the required functionality. When our application is complete, a user will be able to display items, add items, remove items, and mark items as complete.

As we build our application, our design should follow object-oriented principles.  Think through each decision, keeping the [single responsibility principle][wikipedia srp], [separation of concerns][wikipedia soc], and other design principles in mind.

As we work through this exercise, pay close attention to how *change* impacts our application.  When a new feature is added, how many files do we have to change?  How frustrating is it to make each change?  Did our previous design decisions make the application easier or more difficult to modify?


## Releases

###Part 0 : Enumerate the responsibilities

Start by enumerating the responsibilities of your TODO application.  These aren't just the user-facing commands like "add", "delete", etc.  They're also back-end responsibilities like reading and writing from the `todo.csv` file, parsing command-line arguments, and printing the "interface" to the console.

Each responsibility should map to a concrete unit of Ruby code.  For example,

<table class="table table-striped table-bordered">
  <tr>
    <th>Responsibility</th>
    <th>Code world</th>
  </tr>
  <tr>
    <td>Initialize an empty TODO list</td>
    <td>
      <code>list = List.new</code>
    </td>
  </tr>
  <tr>
    <td>Add a task to a TODO list</td>
    <td>
      <code>list.add(Task.new("walk the dog"))</code>
    </td>
  </tr>
  <tr>
    <td>Get all the tasks on a TODO list</td>
    <td>
      <code>tasks = list.tasks</code>
    </td>
  </tr>
  <tr>
    <td>Delete a particular task from a TODO list</td>
    <td><code>???</code></td>
  </tr>
  <tr>
    <td>Complete a particular task on a TODO list</td>
    <td><code>???</code></td>
  </tr>

  <tr>
    <td>Parse the command-line arguments and take the appropriate action</td>
    <td><code>???</code></td>
  </tr>
  <tr>
    <td>Parse the <code>todo.csv</code> file and wrap each entry in easier-to-manipulate Ruby objects</td>
    <td><code>???</code></td>
  </tr>
  <tr>
    <td>There are other responsibilities.  What are they?</td>
    <td></td>
  </tr>
</table>



### Part 1: Display Todo List Items
We have a CSV file that contains descriptions of some todo list items (see `todo_list_data.csv`).  We want to begin our application by displaying a list of items (see Figure 1).

Before writing any code, think through the process necessary to display the list.  What do we need to do?  For example, we need to read the contents of the data file, represent the todo list in Ruby, represent each list item in Ruby, format the list for display, etc.  What other responsibilities are there?

Once we've identified the responsibilities of our application, then determine what objects we need to fulfill those responsibilities—remembering to apply object-oriented design principles.  Then test and develop those objects and complete the release.

```
$ ruby todo.rb
- Walk the cat.
- Go to the gym.
- Buy groceries for the week.
- Call Jeanne.
```
*Figure 1*.  Example of displaying your TODO list.


### Part 2: Add New Items to the List
Add a new feature to the application:  users should be able to add new items to the list.  When running the application, users will now need to specify what they want to do; users will pass command line arguments to  display the todo list or to add a new item (See Figure 2).  When an item is added, persist the change by updating the data store file.  

In adding this feature, our application will have additional responsibilities.  We'll need to parse command line arguments and write to a file.  Anything else?  What object should be responsible for these new responsibilities?  Would it be appropriate for our existing objects to handle them?  Do we need new objects?

Requirements:

- A user can add (append) a task to their TODO list

```
$ ruby todo.rb list
1. Walk the cat.
2. Go to the gym.

$ ruby todo.rb add "Finish my coding exercise."
Appended "Finish my coding exercise." to your TODO list.

$ ruby todo.rb list
1. Walk the cat.
2. Go to the gym.
3. Finish my coding exercise.
```
*Figure 2*.  Use command line arguments to display a todo list or add a new item.


### Part 3: Remove Items from the List
Sometimes we add an item to the list, but as time passes we no longer want or need to complete it.  Rather than have such items sit on the list forever, add a feature that allows users to remove items (see Figure 3).  Users should be able to remove items using the IDs of the items, or by using a string. For a string, it will remove the first item where the string exists. Again, we want to persist changes to the list, so the data store file should be updated to reflect that an item was removed.

Requirements:

- A user can delete a specific task from their TODO list

```
$ ruby todo.rb list
1. Walk the cat.
2. Go to the gym.
3. Finish my coding exercise.

$ ruby todo.rb delete 2
Removed "Go to the gym." from your TODO list.

$ ruby todo.rb delete "coding"
Removed "Finish my coding exercise." from your TODO list.

$ ruby todo.rb list
1. Walk the cat.
```
*Figure 3*.  Removing an item from your TODO list.


### Part 4: Mark Items as Complete
What do we do when we complete an item?  Given the current feature set, we'd have to remove it from the list; otherwise, it looks like we still need to take action on the item.  Add a feature that allows for completeness (see Figure 4).   Users should be able to mark complete by using the IDs of the items, or by using a string. For a string, it will mark the first item where the string exists as complete. As with the other changes to the list, marking an item as complete should be persisted in the data store.

Completing this feature will involve a number of changes.  We'll have to update our data file to store whether each item is complete.  We'll have to change how an item is represented in Ruby; its state will need to reflect its completeness.  We'll need to modify how a list is displayed.  What other changes will we need to make?  As we add this completeness feature, be mindful of how our design decisions facilitate and/or hinder the change.

Requirements:

- A user can complete a specific task from their TODO list
- A completed TODO task will be identified as such when a user uses the `list` command

**Note**: This will require changing the format of `todo.csv` and the code that parses it.

```
$ ruby todo.rb list
[ ] 1. Walk the cat.
[ ] 2. Go to the gym.

$ ruby todo.rb complete "walk the cat"
Marked "Walk the cat." as complete.

$ ruby todo.rb list
[X] 1. Walk the cat.
[ ] 2. Go to the gym.
```
*Figure 4*.  Marking an item as complete.


### Part 5: Human Readable Data Store
Our todo list application is working well, but it's confined to the terminal.  Without their computers handy, users cannot access their todo lists.  But what if users could print out their lists before going to run errands or what-have-you?  To facilitate printing a todo list, we'll format our data file to be more readable.

Update the data store file in which we're storing the item data.  We'll switch from using a CSV file to using a plain text file (.txt) formatted as seen in Figure 5.

We're changing the backend data store file.  Pay attention to the effect this change has on our application.  For example, we won't be using Ruby's `CSV` library any longer, so we'll need to update the way we read in and write out item data.  Which objects do we expect to be affected by this change?  Which objects are actually affected?


```text
1. [X] Walk the cat.
2. [ ] Go to the gym.
3. [X] Buy groceries for the week.
4. [ ] Call Jeanne.
5. [ ] Finish my coding exercise.
6. [ ] Book hotel for vacation.
```
*Figure 5*.  Format for the new data file.


## Conclusion
Think about the responsibilities in our application.  There are four high-level responsibilities.

1. Manipulating in-memory Ruby objects that model a real-life todo list (Model).
2. Formatting information and displaying it to the user (View).
3. Interpreting user input and taking the appropriate action (Controller).
4. Reading and writing data from a data file (Persistance).

Model-View-Controller is a design pattern that we'll use to design almost all of our applications—both our command-line applications and our web applications later.  We'll learn more about this design pattern going forward.  Which parts of our todo list application represent the model, the view, and the controller?



[wikipedia soc]: http://en.wikipedia.org/wiki/Separation_of_concerns
[wikipedia srp]: http://en.wikipedia.org/wiki/Single_responsibility_principle


