Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA77A1B76EA
	for <lists+cocci@lfdr.de>; Fri, 24 Apr 2020 15:26:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03ODPh6D013867;
	Fri, 24 Apr 2020 15:25:43 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id EC6C9782E;
	Fri, 24 Apr 2020 15:25:42 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B1EC87815
 for <cocci@systeme.lip6.fr>; Fri, 24 Apr 2020 15:25:41 +0200 (CEST)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03ODPfcg022894
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <cocci@systeme.lip6.fr>; Fri, 24 Apr 2020 15:25:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587734740;
 bh=ELsK15oYjcvfBEQpNp9r/X7ShJLp0wrDU+jJt0MyM88=;
 h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
 b=gxmueu4g/cCEzkKJ0kvQVoPTCnB7xwcYMmeAgvfMa/Pb/AaJ3tC4oXWeWisYZ+gkz
 utnjvI0/XVN+5fKYH9tD2nG+SswZaWLYdSeVx1rJAk4xAjTrhtpqypgbH+GenKbm4j
 hwwJnljvLIci8eJ6qtiXrpI9cnQf/ZzpIvH+i+3w=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.129.82]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MSai0-1jblxf43IS-00RVYD; Fri, 24
 Apr 2020 15:25:40 +0200
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5122a033-4ce4-90eb-02f3-93ad940a5ec6@web.de>
Date: Fri, 24 Apr 2020 15:25:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:42KQLVFAu4RFvdN1GSmfBQ7oM+7gOrStpWnO4rYvxoWcADd74gr
 xtyn5Chi/iWJul/5ND+R4CvnDyWiSkF8uJBQcWEy8crhNtDAXP31W7SB6fqnzGGPr7Fkppz
 mGYVrlwQhzzvbLW7Ss9UjjBEwReOhv9AVfdqkh+ngx8mE4gKqMwS9hBFf+V2m1l152llSPh
 6/KCmS91ftPDDdDj3Z/6w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:I7IzT3IpFb4=:Uhw4fU3rGovkuffEViyDaa
 figESYCUeV8kJ0S7XogNBapOQ7GpGenRQp6kOhLVa5M4CfCnJJlIg2q+pWuqj20oHgmLW3FQm
 0UqEe9QhYf9L5Oyl0XMtcWaXPvgJvk+IZKcTgiXTWdsm3WIvaRIU8vbSw72I0Vin+5Lb9JPMY
 gJnKFsAqOpImBCLGh02In4+qD1rhKTdez+dH24zZAyJ/IfDE3QqgOendw8ZBiAjthVkAcW/aV
 wrjBmYjPbycVBCNx07bfsyGBCKmRspDr6x2hHXW29kTh79Cc8sZtE76DbFpW+cCab+2F0R9HM
 wGoDrdrpyMgtjxmiKMntmSMZrk+LmJJcn9e8Rq3HEiRLNAiFcnoSIdbuqZn3gtbOfSgBk1LEo
 S4iB8wLg+1MifkLqigSn36cM1PJZMY/z/ivebop5sa+S1st/rMfR8/MDMpP6U8FCaOts9SV0K
 rwccvQ4uthB78tel5BcWeVLb2tPEmVwec5tEGZ8GnY46oapYc5x7JEKbtj7pmWN0s71utONQ0
 chamRzE2ge5Doj8aenv+czrH3VbYWfZiebmujhMavCeSDe9z7tTpX2EEmOKXxYpUiFrS325YR
 OgL6FikpKKhPaOmGq2jf5V1mW1uZw95pbRUfZ91Q5iCbbrFEAbVBzC1+iHbl9Ns90y4l9qbcC
 UBp/3AT5xW6CKTkLEnvbu08TOvZKZTLPoay6HmBFv3SDn/2Gql3HICwm5XXXomEtIq+dr5o6F
 KgHQpzp6hcf2m3AVRQVdNampvaLrwk3GoIBsJai3H3cQGxNMJ4VepmUKiGYqSffla/BfogAM2
 e0XtpFSsML/7NjoqEudY4zDnVprF9jxRexjaTOhicR/p5vgy9sq8FfPmbdpUZ/3XLgcNmIEc8
 sKmk8kQf+wgRa6KoEdWsWQWFV0VMwdFBr83QqZbAzJfNNCXFkN3t3Gpeda0PQ2F9rLBdDg1OM
 Yb1wUNeLmsWxO2Q51IGQIwQCFOA2drm26PlXpmpXxKEtl50Y862WizrNx4V7VBP4EqC0g7BkM
 w5TBcHGT1yQKfvmiTlaWrrcIY2YinUJYS8kigTynoPmx1Pj6ts+8EccnGhzu+gglwPZddjsYy
 FV1ilcktvppx0sadAL5qRxBPnaVoE3+hzwVXNAG23IxfRssIsiDuoqFBaPUi0mAB5lcXsTSjN
 u2+bj3oSxvpzNditfq0FUGHip8IkBvm+BO1kDQ+FYEW2GjzZg5SXDnRS3yOYu9j4dluwBX8mI
 D9n/3hulQLIyHJGLk
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 24 Apr 2020 15:25:43 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 24 Apr 2020 15:25:41 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [RFC PATCH 23/25] parsing_c: type_c: Add parameter
 attributes to record
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

> Paramter attributes are added to the C AST.

Please avoid a typo in the first word for this change description.

Regards,
Markus
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
