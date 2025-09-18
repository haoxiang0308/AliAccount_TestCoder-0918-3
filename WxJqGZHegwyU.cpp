// WxJqGZHegwyU.cpp
// Implementation of player input handling class for Unreal Engine

#include "WxJqGZHegwyU.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Pawn.h"
#include "Engine/World.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
	// Set this actor to call Tick() every frame. You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
	// Setup input bindings
 SetupInputBindings();
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

// Setup input bindings
void APlayerInputHandler::SetupInputBindings()
{
	// Get the player controller
	APlayerController* PlayerController = GetWorld()->GetFirstPlayerController();
	if (PlayerController)
	{
		// Bind input actions
		PlayerController->InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
		PlayerController->InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
		PlayerController->InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);
		PlayerController->InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
		
		PlayerController->InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
		PlayerController->InputComponent->BindAction("Jump", IE_Released, this, &APlayerInputHandler::StopJumping);
	}
}

// Movement functions
void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		// Move the player forward/backward
		APlayerController* PlayerController = GetWorld()->GetFirstPlayerController();
		if (PlayerController && PlayerController->GetPawn())
		{
			FRotator Rotation = PlayerController->GetPawn()->GetActorRotation();
			FVector Direction = FRotationMatrix(Rotation).GetScaledAxis(EAxis::X);
			PlayerController->GetPawn()->AddMovementInput(Direction, Value);
		}
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		// Move the player left/right
		APlayerController* PlayerController = GetWorld()->GetFirstPlayerController();
		if (PlayerController && PlayerController->GetPawn())
		{
			FRotator Rotation = PlayerController->GetPawn()->GetActorRotation();
			FVector Direction = FRotationMatrix(Rotation).GetScaledAxis(EAxis::Y);
			PlayerController->GetPawn()->AddMovementInput(Direction, Value);
		}
	}
}

// Camera functions
void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		APlayerController* PlayerController = GetWorld()->GetFirstPlayerController();
		if (PlayerController && PlayerController->GetPawn())
		{
			PlayerController->GetPawn()->AddControllerYawInput(Value);
		}
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	if (Value != 0.0f)
	{
		APlayerController* PlayerController = GetWorld()->GetFirstPlayerController();
		if (PlayerController && PlayerController->GetPawn())
		{
			PlayerController->GetPawn()->AddControllerPitchInput(Value);
		}
	}
}

// Jump functions
void APlayerInputHandler::Jump()
{
	APlayerController* PlayerController = GetWorld()->GetFirstPlayerController();
	if (PlayerController && PlayerController->GetPawn())
	{
		PlayerController->GetPawn()->Jump();
	}
}

void APlayerInputHandler::StopJumping()
{
	APlayerController* PlayerController = GetWorld()->GetFirstPlayerController();
	if (PlayerController && PlayerController->GetPawn())
	{
		PlayerController->GetPawn()->StopJumping();
	}
}