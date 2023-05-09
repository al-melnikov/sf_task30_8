package main

import (
	"fmt"
	"task30_8/pkg/storage"
)

func main() {

	taskExample := storage.Task{
		ID:         1,
		Opened:     999,
		Closed:     0,
		AuthorID:   555,
		AssignedID: 666,
		Title:      "something",
		Content:    "long text",
	}

	var constr string = "user=postgres password=password host=localhost port=5432 dbname=tasks sslmode=disable"

	db, err := storage.New(constr)

	if err != nil {
		fmt.Println(err)
	}
	db.NewTask(taskExample)

	db.DropTask(4)
	tasks, err := db.AllTasks()

	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(tasks)

	tasks, err = db.TasksByAuthorID(0)

	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(tasks)

}
