# 🔍 Suspect Database System

A relational database system designed to assist detectives and forensic investigators in managing, searching, and cross-referencing suspect information during criminal investigations.

> **Course Project** — Database Course, Al-Maaref University  
> **Authors:** Nour Merhi & Maryam Morsel  
> **Instructor:** Dr. Mubarak Mohammad  
> **Date:** January 3, 2024

---

## 📌 Overview

The **Suspect Database** addresses the need for organized, up-to-date global data on criminal suspects to support international investigations. The system allows law enforcement professionals to:

- Store and query detailed physical descriptions of suspects (face, body, hands, feet, hair)
- Track suspect addresses and residential history
- Maintain criminal records and link suspects to victims
- Store hospital and medical examination records
- Record personal relationships (mother, wife, witnesses)

---

## 🗂️ Database Entities

The database is built around **15 core entities**:

| Entity | Description |
|---|---|
| `Suspect` | Core personal information: name, gender, date of birth, phone number |
| `Face` | Facial features: forehead, eyebrows, eye color, nose, mouth, chin, face shape |
| `Body` | Physical build: height, weight, body shape |
| `Hands` | Hand characteristics: shape, finger count, fingerprints |
| `Feet` | Foot characteristics: shape, size, toe count |
| `Hair` | Hair color, length, and shape |
| `Location` | City, country, and address of residence |
| `Building` | Building details including floor number |
| `Apartment` | Apartment number and phone number (weak entity) |
| `CriminalRecord` | Crime type, date, location, and associated victim |
| `Victim` | Victim's name, gender, and age |
| `HospitalRecord` | Medical examination records linked to suspects |
| `Doctor` | Doctor details: name and specialty |
| `MotherInfo` | Suspect's mother's full name and phone number |
| `WifeInfo` | Suspect's wife's full name and phone number |

---

## 🔗 Key Relationships

- A **Suspect** has one Body, one Face (via Body), and optional Hair
- A **Suspect** may have one or more Locations, one CriminalRecord, one Mother, and one Wife
- A **CriminalRecord** is linked to one Victim
- A **HospitalRecord** is associated with one or more Doctors (via Work relationship)
- A **Building** belongs to one Location and contains one or more Apartments
- **Suspects** can also be witnesses or be accused by other suspects (self-referencing relationship)

---

## 🗺️ ER Diagram

The ER diagram covers all entities, their attributes, and relationships using standard ER notation including:
- Primary keys (underlined)
- Foreign keys
- Weak entities (double rectangle — `Apartment`)
- Multi-valued and derived attributes
- Self-referencing relationships (`Suspect` ↔ `Suspect` via witness/acclaimed)

*(See `ER_Diagram.png` in this repository)*

---

## 🧱 Relational Schema

The relational model maps the ER diagram to the following tables (simplified):

```
Face         (FaceID, Forehead, Eyebrows, EyeColor, Nose, Mouth, Chin, FaceShape, BodyID [FK], HairID [FK])
Body         (BodyID, Height, Weight, BodyShape, HandID [FK], FeetID [FK])
Hands        (HandID, FingerNumbers, HandShape, Fingerprints, HandNumber)
Feet         (FeetID, FingerNumbers, FootShape, FootSize, FeetNumber)
Hair         (HairID, Color, HairHeight, HairShape)
Suspect      (SuspectID, FirstName, MiddleName, LastName, Gender, DateOfBirth, FaceID [FK], LocationID [FK], CrimeID [FK], MotherID [FK], WifeID [FK])
SuspectPhoneNb (PersonalPhoneNb, SuspectID [FK])
Witness      (Witness [FK], Acclaimed [FK])
Location     (LocationID, City, Country, Address)
Building     (BuildingID, FloorNb, LocationID [FK])
Apartment    (AppNb, BuildingID [FK], ApartmentPhoneNb)
CriminalRecord (CrimeID, Record, CrimeType, DateOfCrime, LocationOfCrime, VictimID [FK], HospitalID [FK])
Victim       (VictimID, FirstName, LastName, Gender, Age)
HospitalRecord (HospitalID, Record)
Examination  (TypeOfExamination, HospitalID [FK])
Work         (HospitalID [FK], DoctorID [FK])
Doctor       (DoctorID, FirstName, LastName, Specialty)
MotherInfo   (MotherID, FirstName, MiddleName, LastName, PhoneNumber)
WifeInfo     (WifeID, FirstName, LastName, PhoneNumber)
```

---

## 💾 Sample SQL Queries

### Join Queries (2 Tables)

```sql
-- Retrieve a suspect's full name and their mother's name
SELECT s.firstName, s.MiddleName, s.LastName, m.FirstName, m.LastName
FROM suspect AS s
INNER JOIN mother AS m ON m.motherId = s.motherID;

-- Retrieve suspects with green eyes, rectangular face, and small mouth
SELECT s.firstName, s.LastName
FROM suspect AS s
INNER JOIN face AS f ON f.FaceID = s.FaceID
WHERE f.eyeColor = 'Green' AND f.faceShape = 'Rectangular' AND f.mouth = 'Small';
```

### Join Queries (3+ Tables)

```sql
-- Retrieve the victim's name linked to a specific criminal
SELECT v.firstName, v.lastName
FROM victim AS v
INNER JOIN criminalRecord AS c ON v.victimID = c.victimID
INNER JOIN suspect AS s ON s.crimeID = c.CrimeID
WHERE s.FirstName = 'Nour' AND s.lastName = 'Morsel';

-- Retrieve suspects living on the 10th floor
SELECT s.firstName, s.middleName, s.lastName
FROM suspect AS s
INNER JOIN location AS l ON l.LocationID = s.locationID
INNER JOIN building AS b ON b.LocationId = l.locationId
WHERE b.floorNB = 10;
```

### Subqueries

```sql
-- Retrieve all phone numbers of suspects whose wife is named Maryam Merhi
SELECT * FROM suspectPhoneNb
WHERE suspectId = (
  SELECT suspectID FROM suspect
  WHERE WifeId = (
    SELECT wifeId FROM wifeInfo
    WHERE FirstName = 'Maryam' AND lastName = 'Merhi'
  )
);
```

### Aggregate Queries

```sql
-- Count total criminal records on file
SELECT COUNT(record) FROM criminalRecord WHERE record = 'Yes';

-- Count suspects with brown eyes
SELECT COUNT(*) FROM suspect
WHERE faceId = (SELECT faceId FROM face WHERE eyeColor = 'Brown');
```

### Sorting

```sql
-- Retrieve all suspects ordered from oldest to youngest
SELECT * FROM suspect ORDER BY dateOfBirth DESC;
```

---

## 🛠️ Technologies Used

- **Database:** Relational Database (SQL)
- **Modeling Tools:** ER Diagram, Relational Schema
- **Language:** SQL (DDL + DML)

---

## 👥 Authors

| Name | Role |
|---|---|
| Nour Merhi | Co-developer |

---

## 📄 License

This project was developed for academic purposes at **Al-Maaref University** as part of the Database Course curriculum.
