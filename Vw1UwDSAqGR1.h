// Vw1UwDSAqGR1.h
// Player input handler class for Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "Vw1UwDSAqGR1.generated.h"

UCLASS()
class AVw1UwDSAqGR1 : public ACharacter
{
	GENERATED_BODY()

public:
	// Sets default values for this character's properties
	AVw1UwDSAqGR1();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

	// Input functions
	void MoveForward(float Value);
	void MoveRight(float Value);
	void StartCrouch();
	void StopCrouch();
};