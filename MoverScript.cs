using UnityEngine;

public class MoverScript : MonoBehaviour
{
    public float speed = 5.0f; // Speed of movement
    
    void Update()
    {
        // Move the object forward along its local Z-axis
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }
}