
 // Movie Ticket Management System
 // DA3 - Neo4j Cypher Queries

// 1. Visualize the customer-booking-movie graph
MATCH p = (c:Customer)-[:MADE]->(b:Booking)
          -[:FOR_SHOW]->(sh:Show)-[:FEATURES]->(m:Movie)
RETURN p
LIMIT 25;

// 2. View customers and their bookings
MATCH (c:Customer)-[:MADE]->(b:Booking)
RETURN c.name AS Customer,
       b.booking_id AS BookingID,
       b.status AS BookingStatus
ORDER BY BookingID;

// 3. Find the most popular movies
MATCH (b:Booking)-[:FOR_SHOW]->(:Show)-[:FEATURES]->(m:Movie)
WHERE b.status = 'CONFIRMED'
RETURN m.title AS Movie,
       count(b) AS ConfirmedBookings
ORDER BY ConfirmedBookings DESC, Movie
LIMIT 10;

// 4. Find movies by genre and rating
MATCH (m:Movie)
RETURN m.genre AS Genre,
       m.title AS Movie,
       m.rating AS Rating
ORDER BY Genre ASC, Rating DESC;

// 5. Find theatres showing movies
MATCH (sh:Show)-[:FEATURES]->(m:Movie),
      (sh)-[:IN_SCREEN]->(s:Screen)-[:PART_OF]->(t:Theatre)
RETURN m.title AS Movie,
       sh.show_date AS ShowDate,
       sh.show_time AS ShowTime,
       s.name AS Screen,
       t.name AS Theatre
ORDER BY ShowDate, ShowTime;

// 6. View booking and payment details
MATCH (c:Customer)-[:MADE]->(b:Booking)-[:HAS_PAYMENT]->(p:Payment)
RETURN c.name AS Customer,
       b.booking_id AS BookingID,
       p.payment_id AS PaymentID,
       p.method AS PaymentMethod,
       p.status AS PaymentStatus
ORDER BY BookingID;

// 7. Recommend movies based on a customer's preferred genres
MATCH (c:Customer {customer_id: 3})-[:MADE]->(:Booking)
      -[:FOR_SHOW]->(:Show)-[:FEATURES]->(watched:Movie)
MATCH (recommended:Movie)
WHERE recommended.genre = watched.genre
  AND NOT EXISTS {
    MATCH (c)-[:MADE]->(:Booking)-[:FOR_SHOW]->(:Show)
          -[:FEATURES]->(recommended)
  }
RETURN DISTINCT c.name AS Customer,
       watched.genre AS PreferredGenre,
       recommended.title AS RecommendedMovie,
       recommended.rating AS Rating
ORDER BY Rating DESC
LIMIT 5;

// 8. Check booking and payment coverage
MATCH (b:Booking)
OPTIONAL MATCH (b)-[:HAS_PAYMENT]->(p:Payment)
RETURN count(DISTINCT b) AS TotalBookings,
       count(DISTINCT p) AS TotalPayments,
       count(DISTINCT CASE WHEN p IS NOT NULL THEN b END)
         AS BookingsWithPayment,
       count(DISTINCT CASE WHEN p IS NULL THEN b END)
         AS BookingsWithoutPayment;
