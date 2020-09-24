Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55081277A11
	for <lists+cocci@lfdr.de>; Thu, 24 Sep 2020 22:19:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 08OKJ8OO029445;
	Thu, 24 Sep 2020 22:19:08 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 30C9D77BF;
	Thu, 24 Sep 2020 22:19:08 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D7AC34452
 for <cocci@systeme.lip6.fr>; Thu, 24 Sep 2020 22:19:04 +0200 (CEST)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 08OKJ4sm000944
 for <cocci@systeme.lip6.fr>; Thu, 24 Sep 2020 22:19:04 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600978743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K3Ao4b3S2fuWHiT8hpHEfpFg0aMIND0J6gnDyFzzIBY=;
 b=GWue+NIuBy3soO1ehVcKQ0rhV7iiszDX+YP1KJTAEHVSQgmEr0exmzz2J4MqZGx4Tot8v8
 8C99zKaMGY8rEap5ElRRH/06ZSQjK6d6vwbjOJqJfeehwbYfmX7IpWovnqQcgtcbvYgKPg
 2k6LtR9J88o8a248c1eTOqHQxUs1RZEC6bGhNNrfLzWQ9Kb25k8rCNLH5rZ0/DxA/klLMX
 dq38wVBZLcSs/SJ60pToFbYt22R/DQI37BaLdTWyJrdrXTUiUf9BTY3WEruM2pFuU4d2D9
 4MZLzbhGq3AIgEh22Y3zH3CDM0C2rd84Obf+bamKY7UiKUjRnb5PV+TvZ0ZhEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600978743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K3Ao4b3S2fuWHiT8hpHEfpFg0aMIND0J6gnDyFzzIBY=;
 b=hlFfk2k9cjx+noi/lmUByUkYc4oJUkZkwXH/rwvb2cEdWBlfBMkm9XXGEhDEwmjZrwUf/E
 JrImDs46jCfPfLCQ==
To: Julia Lawall <julia.lawall@inria.fr>, Joe Perches <joe@perches.com>
In-Reply-To: <alpine.DEB.2.22.394.2008220905460.3150@hadrien>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org>
 <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
 <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com>
 <alpine.DEB.2.22.394.2008201021400.2524@hadrien>
 <a5713d8597065ef986f780499428fcc4cd31c003.camel@perches.com>
 <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
 <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
 <162653.1598067338@turing-police>
 <3836b482434bd0b9a609959d3696cc6113a93f2f.camel@perches.com>
 <alpine.DEB.2.22.394.2008220905460.3150@hadrien>
Date: Thu, 24 Sep 2020 22:19:03 +0200
Message-ID: <87tuvn6i88.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 24 Sep 2020 22:19:10 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 24 Sep 2020 22:19:04 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Giuseppe Scrivano <gscrivan@redhat.com>,
        Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] coccinelle: Convert comma to semicolons (was Re:
	[PATCH] checkpatch: Add test for comma use that should be semicolon)
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

On Sat, Aug 22 2020 at 09:07, Julia Lawall wrote:
> On Fri, 21 Aug 2020, Joe Perches wrote:
>> True enough for a general statement, though the coccinelle
>> script Julia provided does not change a single instance of
>> for loop expressions with commas.
>>
>> As far as I can tell, no logic defect is introduced by the
>> script at all.
>
> The script has a rule to ensure that what is changed is part of a top
> level statement that has the form e1, e2;.  I put that in to avoid
> transforming cases where the comma is the body of a macro, but it protects
> against for loop headers as well.

Right. I went through the lot and did not find something dodgy. Except
for two hunks this still applies. Can someone please send a proper patch
with changelog/SOB etc. for this?

And of course that script really wants to be part of the kernel cocci
checks to catch further instances.

Thanks,

        tglx
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
