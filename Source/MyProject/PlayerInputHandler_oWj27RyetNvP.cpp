// PlayerInputHandler_oWj27RyetNvP.cpp
// Implementation of player input handling for Unreal Engine

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"
#include "GameFramework/CharacterMovementComponent.h"
#include "Components/InputComponent.h"

// Player input handler class
class PlayerInputHandler : public APlayerController
{
public:
    // Constructor
    PlayerInputHandler();

    // Called to bind functionality to input
    virtual void SetupInputComponent() override;

    // Movement functions
    void MoveForward(float Value);
    void MoveRight(float Value);
    
    // Look functions
    void Turn(float Value);
    void LookUp(float Value);
    
    // Action functions
    void Jump();
    void StopJumping();
    void Crouch();
    void StopCrouching();

protected:
    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

private:
    ACharacter* ControlledCharacter;
};

// Constructor implementation
PlayerInputHandler::PlayerInputHandler()
{
    // Set this character to call Tick() every frame
    PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts
void PlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();
    ControlledCharacter = Cast<ACharacter>(GetPawn());
}

// Called to bind functionality to input
void PlayerInputHandler::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Movement bindings
    InputComponent->BindAxis("MoveForward", this, &PlayerInputHandler::MoveForward);
    InputComponent->BindAxis("MoveRight", this, &PlayerInputHandler::MoveRight);
    
    // Mouse look bindings
    InputComponent->BindAxis("Turn", this, &PlayerInputHandler::Turn);
    InputComponent->BindAxis("LookUp", this, &PlayerInputHandler::LookUp);
    
    // Action bindings
    InputComponent->BindAction("Jump", IE_Pressed, this, &PlayerInputHandler::Jump);
    InputComponent->BindAction("Jump", IE_Released, this, &PlayerInputHandler::StopJumping);
    InputComponent->BindAction("Crouch", IE_Pressed, this, &PlayerInputHandler::Crouch);
    InputComponent->BindAction("Crouch", IE_Released, this, &PlayerInputHandler::StopCrouching);
}

// Movement function implementations
void PlayerInputHandler::MoveForward(float Value)
{
    if ((ControlledCharacter != nullptr) && (Value != 0.0f))
    {
        // Find out which way is forward
        const FRotator Rotation = ControlledCharacter->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);

        // Get forward vector
        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
        ControlledCharacter->AddMovementInput(Direction, Value);
    }
}

void PlayerInputHandler::MoveRight(float Value)
{
    if ((ControlledCharacter != nullptr) && (Value != 0.0f))
    {
        // Find out which way is right
        const FRotator Rotation = ControlledCharacter->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);

        // Get right vector
        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
        ControlledCharacter->AddMovementInput(Direction, Value);
    }
}

// Look function implementations
void PlayerInputHandler::Turn(float Value)
{
    if ((ControlledCharacter != nullptr) && (Value != 0.0f))
    {
        ControlledCharacter->AddControllerYawInput(Value);
    }
}

void PlayerInputHandler::LookUp(float Value)
{
    if ((ControlledCharacter != nullptr) && (Value != 0.0f))
    {
        ControlledCharacter->AddControllerPitchInput(Value);
    }
}

// Action function implementations
void PlayerInputHandler::Jump()
{
    if (ControlledCharacter != nullptr)
    {
        ControlledCharacter->Jump();
    }
}

void PlayerInputHandler::StopJumping()
{
    if (ControlledCharacter != nullptr)
    {
        ControlledCharacter->StopJumping();
    }
}

void PlayerInputHandler::Crouch()
{
    if (ControlledCharacter != nullptr)
    {
        ControlledCharacter->Crouch();
    }
}

void PlayerInputHandler::StopCrouching()
{
    if (ControlledCharacter != nullptr)
    {
        ControlledCharacter->UnCrouch();
    }
}