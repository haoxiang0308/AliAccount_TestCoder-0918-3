using UnityEngine;

public class MoverScript : MonoBehaviour
{
    public float speed = 5.0f;

    void Update()
    {
        // Move the object forward along its z-axis
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }
}