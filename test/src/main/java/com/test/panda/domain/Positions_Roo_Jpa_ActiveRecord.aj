// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.test.panda.domain;

import com.test.panda.domain.Positions;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Positions_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Positions.entityManager;
    
    public static final List<String> Positions.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager Positions.entityManager() {
        EntityManager em = new Positions().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Positions.countPositionses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Positions o", Long.class).getSingleResult();
    }
    
    public static List<Positions> Positions.findAllPositionses() {
        return entityManager().createQuery("SELECT o FROM Positions o", Positions.class).getResultList();
    }
    
    public static List<Positions> Positions.findAllPositionses(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Positions o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Positions.class).getResultList();
    }
    
    public static Positions Positions.findPositions(Long id) {
        if (id == null) return null;
        return entityManager().find(Positions.class, id);
    }
    
    public static List<Positions> Positions.findPositionsEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Positions o", Positions.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Positions> Positions.findPositionsEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Positions o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Positions.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Positions.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Positions.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Positions attached = Positions.findPositions(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Positions.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Positions.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Positions Positions.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Positions merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
