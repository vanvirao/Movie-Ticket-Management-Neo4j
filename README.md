# Movie Ticket Management System — Neo4j

## Project Overview
This project is a Movie Ticket Management System developed as part of DA3. It demonstrates the use of Neo4j, a graph database, to represent and query relationships between customers, bookings, movies, shows, screens, theatres, and payments.

## Objectives
- Represent the movie ticket booking system using a graph data model.
- Create nodes and relationships between the main entities.
- Query movie popularity, customer booking history, movie ratings, theatre showings, and payments.
- Demonstrate a basic personalized movie recommendation query.

## Technologies Used
- Neo4j Desktop
- Cypher Query Language

## Graph Model

### Node Labels
- Customer
- Booking
- Movie
- Show
- Screen
- Theatre
- Payment

### Relationships
- `Customer -[:MADE]-> Booking`
- `Booking -[:FOR_SHOW]-> Show`
- `Show -[:FEATURES]-> Movie`
- `Show -[:IN_SCREEN]-> Screen`
- `Screen -[:PART_OF]-> Theatre`
- `Booking -[:HAS_PAYMENT]-> Payment`

## Features Demonstrated
1. Customer booking history
2. Movie popularity analysis
3. Movie ratings by genre
4. Theatre and show information
5. Booking and payment details
6. Personalized movie recommendations
7. Booking and payment coverage analysis
8. Graph visualization

## Project Files
- `queries/project_queries.cypher` — Cypher queries used to demonstrate the system.
- `screenshots/` — Screenshots of the Neo4j dashboard and query results (to be added).

## How to Run
1. Install Neo4j Desktop and create or open a Neo4j database.
2. Start the database and open the Query interface.
3. Load the sample graph data using the project's setup queries.
4. Run the queries in `queries/project_queries.cypher` to explore the graph and its relationships.

## Note
The repository documents the Neo4j implementation and its demonstration queries. The sample graph data is illustrative and is not claimed to be a complete migration of the original relational database.

## Conclusion
This project demonstrates how a graph database can model connected entities in a movie ticket booking system and support relationship-based queries and basic recommendations.
