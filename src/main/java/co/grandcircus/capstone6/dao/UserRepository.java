package co.grandcircus.capstone6.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.capstone6.User;

public interface UserRepository extends JpaRepository<User,Long> {
	
	User findByEmail(String email);

}
