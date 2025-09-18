// PlayerInputHandler.cpp
// A Unreal Engine C++ class for handling player input

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"
#include "GameFramework/PlayerInput.h"
#include "InputCoreTypes.h"
#include "Engine/World.h"

// Player input handler class
class PlayerInputHandler
{
public:
    PlayerInputHandler();
    ~PlayerInputHandler();

    // Initialize input bindings
    void InitializeInput(class APlayerController* PlayerController);

    // Input action handlers
    void OnJumpPressed();
    void OnJumpReleased();
    void OnFirePressed();
    void OnFireReleased();
    void OnMoveForward(float Value);
    void OnMoveRight(float Value);
    void OnTurn(float Value);
    void OnLookUp(float Value);

private:
    // Reference to the player controller
    class APlayerController* Controller;

    // Reference to the controlled character
    class ACharacter* ControlledCharacter;
};

// Constructor
PlayerInputHandler::PlayerInputHandler()
{
    Controller = nullptr;
    ControlledCharacter = nullptr;
}

// Destructor
PlayerInputHandler::~PlayerInputHandler()
{
}

// Initialize input bindings
void PlayerInputHandler::InitializeInput(APlayerController* PlayerController)
{
    if (!PlayerController)
    {
        return;
    }

    Controller = PlayerController;
    ControlledCharacter = Cast<ACharacter>(Controller->GetPawn());

    // Bind input actions
    Controller->InputComponent->BindAction("Jump", IE_Pressed, this, &PlayerInputHandler::OnJumpPressed);
    Controller->InputComponent->BindAction("Jump", IE_Released, this, &PlayerInputHandler::OnJumpReleased);
    Controller->InputComponent->BindAction("Fire", IE_Pressed, this, &PlayerInputHandler::OnFirePressed);
    Controller->InputComponent->BindAction("Fire", IE_Released, this, &PlayerInputHandler::OnFireReleased);

    // Bind axis inputs
    Controller->InputComponent->BindAxis("MoveForward", this, &PlayerInputHandler::OnMoveForward);
    Controller->InputComponent->BindAxis("MoveRight", this, &PlayerInputHandler::OnMoveRight);
    Controller->InputComponent->BindAxis("Turn", this, &PlayerInputHandler::OnTurn);
    Controller->InputComponent->BindAxis("LookUp", this, &PlayerInputHandler::OnLookUp);
}

// Jump action handlers
void PlayerInputHandler::OnJumpPressed()
{
    if (ControlledCharacter)
    {
        ControlledCharacter->Jump();
    }
}

void PlayerInputHandler::OnJumpReleased()
{
    if (ControlledCharacter)
    {
        ControlledCharacter->StopJumping();
    }
}

// Fire action handlers
void PlayerInputHandler::OnFirePressed()
{
    // Implement fire logic here
    UE_LOG(LogTemp, Warning, TEXT("Fire pressed"));
}

void PlayerInputHandler::OnFireReleased()
{
    // Implement fire release logic here
    UE_LOG(LogTemp, Warning, TEXT("Fire released"));
}

// Movement axis handlers
void PlayerInputHandler::OnMoveForward(float Value)
{
    if (ControlledCharacter && Value != 0.0f)
    {
        // Find forward direction
        FRotator Rotation = Controller->GetControlRotation();
        FRotator YawRotation(0, Rotation.Yaw, 0);

        // Get forward vector
        FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
        ControlledCharacter->AddMovementInput(Direction, Value);
    }
}

void PlayerInputHandler::OnMoveRight(float Value)
{
    if (ControlledCharacter && Value != 0.0f)
    {
        // Find right direction
        FRotator Rotation = Controller->GetControlRotation();
        FRotator YawRotation(0, Rotation.Yaw, 0);

        // Get right vector
        FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
        ControlledCharacter->AddMovementInput(Direction, Value);
    }
}

// Look axis handlers
void PlayerInputHandler::OnTurn(float Value)
{
    if (Controller && Value != 0.0f)
    {
        Controller->AddYawInput(Value);
    }
}

void PlayerInputHandler::OnLookUp(float Value)
{
    if (Controller && Value != 0.0f)
    {
        Controller->AddPitchInput(Value);
    }
}