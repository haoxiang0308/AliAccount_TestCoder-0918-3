// Fill out your copyright notice in the Description page of Project Settings.

#include "PlayerInputHandler_98765.h"
#include "Engine/Engine.h"

// Sets default values for this component's properties
UPlayerInputHandler_98765::UPlayerInputHandler_98765()
{
	// Set this component to be initialized when the game starts, and to be ticked every frame.
	PrimaryComponentTick.bCanEverTick = true;
}


// Called when the game starts
void UPlayerInputHandler_98765::BeginPlay()
{
	Super::BeginPlay();

	// ...
	
}


// Called every frame
void UPlayerInputHandler_98765::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

	// ...
}