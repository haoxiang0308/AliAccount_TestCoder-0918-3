// Vw1UwDSAqGR1.cpp
// Player input handler class for Unreal Engine

#include "Vw1UwDSAqGR1.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"
#include "Components/InputComponent.h"

// Sets default values
AVw1UwDSAqGR1::AVw1UwDSAqGR1()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

}

// Called when the game starts or when spawned
void AVw1UwDSAqGR1::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void AVw1UwDSAqGR1::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void AVw1UwDSAqGR1::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind input actions
	PlayerInputComponent->BindAxis("MoveForward", this, &AVw1UwDSAqGR1::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &AVw1UwDSAqGR1::MoveRight);
	
	PlayerInputComponent->BindAxis("Turn", this, &AVw1UwDSAqGR1::AddControllerYawInput);
	PlayerInputComponent->BindAxis("LookUp", this, &AVw1UwDSAqGR1::AddControllerPitchInput);
	
	PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &ACharacter::Jump);
	PlayerInputComponent->BindAction("Jump", IE_Released, this, &ACharacter::StopJumping);
	
	PlayerInputComponent->BindAction("Crouch", IE_Pressed, this, &AVw1UwDSAqGR1::StartCrouch);
	PlayerInputComponent->BindAction("Crouch", IE_Released, this, &AVw1UwDSAqGR1::StopCrouch);
}

void AVw1UwDSAqGR1::MoveForward(float Value)
{
	if ((Controller != nullptr) && (Value != 0.0f))
	{
		// find out which way is forward
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// get forward vector
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
		AddMovementInput(Direction, Value);
	}
}

void AVw1UwDSAqGR1::MoveRight(float Value)
{
	if ((Controller != nullptr) && (Value != 0.0f))
	{
		// find out which way is right
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);
	
		// get right vector 
		const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
		// add movement in that direction
		AddMovementInput(Direction, Value);
	}
}

void AVw1UwDSAqGR1::StartCrouch()
{
	// Implement crouch functionality
	Crouch();
}

void AVw1UwDSAqGR1::StopCrouch()
{
	// Implement stop crouch functionality
	UnCrouch();
}