Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0350A1FEC97
	for <lists+cocci@lfdr.de>; Thu, 18 Jun 2020 09:37:46 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05I7bV8W011241;
	Thu, 18 Jun 2020 09:37:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A5CF3402B;
	Thu, 18 Jun 2020 09:37:31 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5EB59402B
 for <cocci@systeme.lip6.fr>; Thu, 18 Jun 2020 09:37:30 +0200 (CEST)
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433:0:0:0:2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05I7bTFF017734
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Thu, 18 Jun 2020 09:37:30 +0200 (CEST)
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.93) (envelope-from <johannes@sipsolutions.net>)
 id 1jlp73-007ZWt-GI; Thu, 18 Jun 2020 09:37:29 +0200
Message-ID: <ccfcbfe20e5cdc710383530ad8deb553c08882f2.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 18 Jun 2020 09:37:28 +0200
In-Reply-To: <alpine.DEB.2.22.394.2006180758241.2391@hadrien>
References: <812b3a31097815244e0f929552819ac1f119f5a0.camel@sipsolutions.net>
 <alpine.DEB.2.22.394.2006172314450.3083@hadrien>
 <dfd11c78ef60afd3dd45097e9bf738499f608867.camel@sipsolutions.net>
 <alpine.DEB.2.22.394.2006180758241.2391@hadrien>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 18 Jun 2020 09:37:31 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 18 Jun 2020 09:37:30 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] moving variable declarations up
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

On Thu, 2020-06-18 at 07:59 +0200, Julia Lawall wrote:

> > What's the difference between "..." and "... when any"?
> 
> A ... B connects an A to the closest B, as you might like in some code
> with lots of locks and unlocks.  When any picks up any subsequent B, even
> if there is another B between the matched A and B.

OK, great, thanks for the explanation.

Thanks a lot for your help!

johannes

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
