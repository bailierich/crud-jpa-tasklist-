package co.grandcircus.capstone6.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.capstone6.Task;

public interface TaskRepository extends JpaRepository<Task,Long> {
	
	List<Task> findByUserId(Long id);

}
