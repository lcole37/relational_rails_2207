# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

CRUD

[ ] done

User Story 1, Parent Index

For each parent table
As a visitor
When I visit '/parents'
Then I see the name of each parent record in the system
[ ] done

User Story 2, Parent Show

As a visitor
When I visit '/parents/:id'
Then I see the parent with that id including the parent's attributes:
- data from each column that is on the parent table
[ ] done

User Story 3, Child Index

As a visitor
When I visit '/child_table_name'
Then I see each Child in the system including the Child's attributes:
[ ] done

User Story 4, Child Show

As a visitor
When I visit '/child_table_name/:id'
Then I see the child with that id including the child's attributes:
[ ] done

User Story 5, Parent Children Index

As a visitor
When I visit '/parents/:parent_id/child_table_name'
Then I see each Child that is associated with that Parent with each Child's attributes:
