Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB6A2631D
	for <lists+cocci@lfdr.de>; Wed, 22 May 2019 13:40:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4MBdSxO023543;
	Wed, 22 May 2019 13:39:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9F4C17759;
	Wed, 22 May 2019 13:39:28 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EC5BF7747
 for <cocci@systeme.lip6.fr>; Wed, 22 May 2019 13:39:26 +0200 (CEST)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20:0:0:0:42b] (may be forged))
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4MBdPaS001587
 for <cocci@systeme.lip6.fr>; Wed, 22 May 2019 13:39:25 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id g12so1896892wro.8
 for <cocci@systeme.lip6.fr>; Wed, 22 May 2019 04:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linbit-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EOHqJApWMtjckQvH0H/0anTxYTdiEnQAErAytzLflVg=;
 b=KwQozD0kDpvfHbvD5mmHJN7XdvQnYykOl19rvVEVq6sRMOsa1ouWDywhDgFedeQd+l
 Tvhc99oxn84fDhRzJKWK1iU81/3eGHMyK9EibfORrohu+sHthVFZlHLUh/hkTeMhweSn
 /tS24AgdKiR6/T/hShPCAZOuQ4J0A8JuL21pox4LE2Z96avb6BQ/nuDoI8A+6Pvt/nj0
 9mvR0HE9L8CSJDY0qtrJDR5ILfo+WNOomY2c/zG1P+zL6lglmmcXLAUEFJrkwZrNgsI6
 SNPkjkyoDebwUnPvFiHf3avzqR2Gksn5P22+oO96rmxVVCta1TTA2WZUyuz0GzTGkIIt
 AZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EOHqJApWMtjckQvH0H/0anTxYTdiEnQAErAytzLflVg=;
 b=M2SATVETQVk9Ok4lM9fS9K/TTNn8/Jw1yA2cL1UKW0hZi3t2iU3K8zkak1MgtqD1UE
 qnEz/MUpaQ3XqncU7Bw6JiKtFxRaxnkVUam3BWgm4CNuaVTAxT+uX5vXwor6OotHzJhV
 cwLKR5Tv9+Bt6vG0o/WHU2fWVNXOzJ7mW1loq5GgFRZkkQ7MYfkOF+NXqvT2xj07V7ne
 Ly59nC2ph7+kGYiesou7smhouKjMy8k4oIiWsRA6UmN3qwIlfIVfeXr/KIfpIwj4qnR7
 hylJkGBoSWwGAz9eEM03kDTg0uouvphNSwjDh53A/b0ouCHfyFFJP/DyaCkuj9Pwe7dF
 Ru2A==
X-Gm-Message-State: APjAAAVLqvQiDmWiWmm3VDmscvGBAkP7E3HHSTaRLtKC02SRlcb5T97z
 KLa3NROtdGdWunUWqHFfJm1mCAakRmY=
X-Google-Smtp-Source: APXvYqw1/OkwEpA+qsSI10tK/HU1r6RkeEohizwemDlOuh0yIU8+2N2Gqszn10G2Nr4A4UI6bP3ItQ==
X-Received: by 2002:adf:ef8f:: with SMTP id d15mr500843wro.330.1558525165600; 
 Wed, 22 May 2019 04:39:25 -0700 (PDT)
Received: from ?IPv6:2001:858:107:1:302b:5254:7ca1:efe0?
 ([2001:858:107:1:302b:5254:7ca1:efe0])
 by smtp.gmail.com with ESMTPSA id a14sm7033223wrv.3.2019.05.22.04.39.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 04:39:25 -0700 (PDT)
To: Julia Lawall <julia.lawall@lip6.fr>
References: <86fdc128-e077-58d1-2170-912937317ab1@linbit.com>
 <alpine.DEB.2.20.1905221330110.4390@hadrien>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
Message-ID: <ae3c7e1d-92ab-13d1-edfa-796e520909ab@linbit.com>
Date: Wed, 22 May 2019 13:39:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1905221330110.4390@hadrien>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 22 May 2019 13:39:28 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 22 May 2019 13:39:25 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Does coccinelle support non-standard C?
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

On 22.05.19 13:37, Julia Lawall wrote:
> Is it always exactly this string that you want to add?

In my case, yes. I don't have any metavariable substitutions, etc; it's 
always the same constant code.

--
Regards,
Christoph

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
