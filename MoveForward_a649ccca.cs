using UnityEngine;

public class MoverScript : MonoBehaviour
{
    public float speed = 5.0f; // Speed of movement
    public Vector3 direction = Vector3.forward; // Direction to move (default is forward)

    void Update()
    {
        // Move the object forward based on its local Z-axis
        transform.Translate(direction * speed * Time.deltaTime);
    }
}