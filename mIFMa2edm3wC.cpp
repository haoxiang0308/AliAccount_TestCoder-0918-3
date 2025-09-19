// mIFMa2edm3wC.cpp
// Implementation of the player input handler class

#include "mIFMa2edm3wC.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/Controller.h"

// Constructor
AmIFMa2edm3wC::AmIFMa2edm3wC()
{
	// Set this controller to call Tick() every frame
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void AmIFMa2edm3wC::BeginPlay()
{
	Super::BeginPlay();
}

// Called every frame
void AmIFMa2edm3wC::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

// Called to bind functionality to input
void AmIFMa2edm3wC::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Movement bindings
	InputComponent->BindAxis("MoveForward", this, &AmIFMa2edm3wC::MoveForward);
	InputComponent->BindAxis("MoveRight", this, &AmIFMa2edm3wC::MoveRight);
	
	// Mouse/turning bindings
	InputComponent->BindAxis("Turn", this, &AmIFMa2edm3wC::Turn);
	InputComponent->BindAxis("LookUp", this, &AmIFMa2edm3wC::LookUp);
	
	// Action bindings
	InputComponent->BindAction("Jump", IE_Pressed, this, &AmIFMa2edm3wC::Jump);
	InputComponent->BindAction("Jump", IE_Released, this, &AmIFMa2edm3wC::StopJumping);
}

// Input functions
void AmIFMa2edm3wC::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Find the forward direction
		APawn* ControlledPawn = GetPawn();
		if (ControlledPawn)
		{
			FRotator Rotation = ControlledPawn->GetActorRotation();
			// Limit pitch when moving forward
			FRotator YawRotation(0, Rotation.Yaw, 0);

			// Get forward vector
			FVector ForwardDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
			ControlledPawn->AddMovementInput(ForwardDirection, Value);
		}
	}
}

void AmIFMa2edm3wC::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Find the right direction
		APawn* ControlledPawn = GetPawn();
		if (ControlledPawn)
		{
			FRotator Rotation = ControlledPawn->GetActorRotation();
			FRotator YawRotation(0, Rotation.Yaw, 0);

			// Get right vector
			FVector RightDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
			ControlledPawn->AddMovementInput(RightDirection, Value);
		}
	}
}

void AmIFMa2edm3wC::Turn(float Value)
{
	// Calculate delta for this frame from the rate information
	AddYawInput(Value);
}

void AmIFMa2edm3wC::LookUp(float Value)
{
	// Calculate delta for this frame from the rate information
	AddPitchInput(Value);
}

void AmIFMa2edm3wC::Jump()
{
	APawn* ControlledPawn = GetPawn();
	if (ControlledPawn)
	{
		ControlledPawn->Jump();
	}
}

void AmIFMa2edm3wC::StopJumping()
{
	APawn* ControlledPawn = GetPawn();
	if (ControlledPawn)
	{
		ControlledPawn->StopJumping();
	}
}