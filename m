Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6C11A698E
	for <lists+cocci@lfdr.de>; Mon, 13 Apr 2020 18:14:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03DGEUtV000853;
	Mon, 13 Apr 2020 18:14:30 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 657C17755;
	Mon, 13 Apr 2020 18:14:30 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 724767755
 for <cocci@systeme.lip6.fr>; Mon, 13 Apr 2020 18:14:29 +0200 (CEST)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03DGESm0001017
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <cocci@systeme.lip6.fr>; Mon, 13 Apr 2020 18:14:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586794468;
 bh=hbJ2RV1GyMYiIA6jGPqSOwCYKkClFP4R1PwsdXIZn+s=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=VJ1igL4CfNZc6RHjIiFUl0wk4h/BIMV+8BbENmwGSYANuM2Exs+8dlLm72S+HnMIV
 RYgUSXvAj2oNm2KOpR/zVeVRiy1rX83oXuMkRV3WpnvhctLiJibRPP7V8DufTeDVTA
 8jk++saPKAdRI+2fk6rDpqjjszBypLv67t/EeEB0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.133.146.177]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MNLFd-1jM6rF0kgr-006ymy; Mon, 13
 Apr 2020 18:14:28 +0200
To: Julia Lawall <julia.lawall@inria.fr>
References: <146360ce-9cfb-e6f5-1601-fa95460c2cd5@web.de>
 <alpine.DEB.2.21.2004101712080.3039@hadrien>
 <f0b37f45-5144-a1c5-3f52-5bfbb6f3635f@web.de>
 <alpine.DEB.2.21.2004111600560.2369@hadrien>
 <fcbca1d9-7375-b488-54b2-a3934b90c6ed@web.de>
 <alpine.DEB.2.21.2004112036270.2369@hadrien>
 <d878a25d-29fd-28b1-fa6f-2e0f44763d73@web.de>
 <alpine.DEB.2.21.2004121050210.2419@hadrien>
 <ab6d402e-3c12-25ab-162a-f200c382dd0a@web.de>
 <d68533a4-554a-fd38-a940-1c3fb15c4dae@web.de>
 <alpine.DEB.2.21.2004130957540.3035@hadrien>
 <7228efff-76bb-44c9-e2cd-ea19bbd49abf@web.de>
 <alpine.DEB.2.21.2004131553460.3035@hadrien>
 <d4324b34-0040-0fb7-d24c-b738ed811c0c@web.de>
 <alpine.DEB.2.21.2004131627470.3035@hadrien>
 <8c9431e7-64e9-9f00-3f10-6fa8e316dcca@web.de>
 <alpine.DEB.2.21.2004131658380.3035@hadrien>
 <12e1bffb-9df2-3b58-a58e-2235f745524b@web.de>
 <alpine.DEB.2.21.2004131758380.3035@hadrien>
 <ee0a51ed-e73f-c71e-5548-ddff136a5028@web.de>
 <alpine.DEB.2.21.2004131809580.3035@hadrien>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <bb1c764c-0475-e856-62f4-433ce3994f26@web.de>
Date: Mon, 13 Apr 2020 18:14:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004131809580.3035@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:qEKM5ubEnVwgrpWyT8MqixzUxo8LjC5X5iI7j8ep7qXlDhVAVHx
 qdRL7SLJmOqhr8kgrR2P1Lnhxp+BWfqCwZ5vxBTYyAc79JozTr2/fi7NEpuDyzhZaaicr8e
 HRieI7rdOtD+f4n3C9tYuFShMyeC/+PAXx+sNOXsN1p7RPnbUALXoD8PTxP7Whzk5YPcljz
 hURjA9mlysUeLMQ34L0UA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6EWiC/UYOGQ=:rQHn9XXCXaZkdSsz7BAaeF
 Q9cl83nvSxtR8wBiB22cdE5p+ppaJplV9t+tklbAx8jkCP1wp6BEHD8oBXL4ufpTdwKis/2k+
 JjNdwd5KF3BZD8XjkDT/Z7q9jU6Ot/9Q3JIMuIk2pWm1brH52ZQu5kF7KWSTsf5ec4SvF6z2/
 ouj58FvIaz/+MJTlwFwJcepO+DvulFR+LjA7e+aLXiSA5if78fSSB3vjaQg03Z91KK4/HHjvo
 Wq8H68P1IwHoMN/myX1f6M4+FcaIibVK5BehBORVcUiSyQr3iRSZ0w2FTwxSO0tdXAk5AlqGv
 50zSLNtXrqLVM1PcvdpzZ73QTczIkG306j4BSRxHhs/HeTTcVzTn+R8cLENnXvz69wp2akbFG
 oQpSLWXxzB80K1AyCn7QXylNfRVCABOhGX7LvxCdnq2zXP2fh0g6Bb/p5rRUZlpFzsIb74lr8
 CdWIdxUfWiTpYmh11TY5c6SvxWlqWmriL4iTL0N1ZZdCbCP95Kw6/e1xseJaucuLgYVj7a6LE
 rqpTzS/9IujAB6N2dzdkhUIMAl7DUTEZBD0l1ZWTqS0dZ72GquzdPyt/4JxZyCYlwgBB8ks3v
 a6JK4MkooUlP5vmLoxKRtK0g07nuAcm+4QftSNo6m2tttwJ4ua7eg7DMo3W77MVG5TODR6qUs
 NBcG6O9jaO/8Kew3+Z4oGEMjrjgla2EKp5xbQXr71q2nMbGvfgFkm8RL4yArj7YwlKiE6mm6m
 bjon91U++6sTSTNKZ+NyOWrmHpYXZiB73r8cnvBmpQpBlkI5eWA0hegSFxE9gTc7D/nf4rX2/
 TorH8vjdAvwRLBvDuR+G91HUHPEW6JXF01OTqSlSRtU1CiSHrvEIIFemU8111c++LpnDzUDz+
 EUD6I+YnW3y2F51osMbt9uv9HE+530h8UPL9GL/STda8ahb4V71+ORtTUpgwU9f0ZvocdQKwp
 Guhu5r6LiP4F8JyofFHoGtGS5UX5fsNy3A7nHTs4rNmSy6oUvxmrjWarmQ2RZjN3Lpe3uTmQK
 Nb5T2AYICzLFpFA335JiXXXL6Vv3HfFCi1SIz7HU85uRd+Dl4HyinkIPtQd6cThS37xBrdTNR
 PNibuMugXtr60zHFO+YF149Lb2/hy0EIpj1gJGd0iUFtNKXwpb4tyr9ShXi3LuaQ9g9y9outo
 CTthJxWc87mnOPbEm8ZYrk+MZ9o3iDZqHA8C6n+SnnaYxRoX9Gove4rA8l4QnAwqFEAC1oCuR
 86PZrg2YgpJcYsXfP
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 13 Apr 2020 18:14:30 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 13 Apr 2020 18:14:29 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] More support for SmPL data processing with databases?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

>>>>> I think that you just want to disable the isomorphism.  Put disable neg_if
>>>>> in the initial @@ of your rule.
>>
>> Will a need evolve to switch isomorphisms completely off for safer
>> (and efficient) analysis of original source code?

Will the corresponding system configuration get any further development considerations?

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
