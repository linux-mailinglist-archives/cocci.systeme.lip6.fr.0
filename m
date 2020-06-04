Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9B71EEB79
	for <lists+cocci@lfdr.de>; Thu,  4 Jun 2020 22:03:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 054K2ruH025678;
	Thu, 4 Jun 2020 22:02:53 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 402577828;
	Thu,  4 Jun 2020 22:02:53 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 18C575D47
 for <cocci@systeme.lip6.fr>; Thu,  4 Jun 2020 22:02:52 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0238.hostedemail.com
 [216.40.44.238])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTPS id 054K2nVK022207
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Thu, 4 Jun 2020 22:02:51 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 2BA3918043DDF
 for <cocci@systeme.lip6.fr>; Thu,  4 Jun 2020 17:37:02 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id EBE1F181B2466;
 Thu,  4 Jun 2020 17:36:58 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:965:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1801:2196:2199:2393:2559:2562:2693:2828:2892:2894:3138:3139:3140:3141:3142:3352:3622:3653:3870:3871:3872:3876:4321:4385:4390:4395:4605:5007:7875:7903:10004:10400:10848:11026:11232:11658:11914:12043:12296:12297:12740:12760:12895:13069:13311:13357:13439:14096:14097:14659:14721:21080:21324:21451:21627:30054:30070:30075:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: bulb68_170feaa26d99
X-Filterd-Recvd-Size: 1947
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf10.hostedemail.com (Postfix) with ESMTPA;
 Thu,  4 Jun 2020 17:36:58 +0000 (UTC)
Message-ID: <7ea2fe7105006f74337498549f167e01d0fd5fc3.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: efremov@linux.com, Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 04 Jun 2020 10:36:56 -0700
In-Reply-To: <d0fced31-f1d7-9e0b-1a58-f441891fcbc7@linux.com>
References: <20200604140805.111613-1-efremov@linux.com>
 <e4981fd76a88e18376c4e634c235501b57d321e7.camel@perches.com>
 <d0fced31-f1d7-9e0b-1a58-f441891fcbc7@linux.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 04 Jun 2020 22:02:53 +0200 (CEST)
X-Greylist: Delayed for 02:16:52 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Thu, 04 Jun 2020 22:02:51 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] coccinelle: api: add kzfree script
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

On Thu, 2020-06-04 at 20:30 +0300, Denis Efremov wrote:
> 
> On 6/4/20 7:27 PM, Joe Perches wrote:
> > On Thu, 2020-06-04 at 17:08 +0300, Denis Efremov wrote:
> > > Check for memset() with 0 followed by kfree().
> > 
> > Perhaps those uses should be memzero_explicit or kvfree_sensitive.
> 
> Thanks, I will add memzero_explicit(). However, I can't find kvfree_sensitive().
> Is it in next already?

Yes

$ git grep kvfree_sensitive
include/linux/mm.h:extern void kvfree_sensitive(const void *addr, size_t len);
mm/util.c: * kvfree_sensitive - Free a data object containing sensitive information.
mm/util.c:void kvfree_sensitive(const void *addr, size_t len)
mm/util.c:EXPORT_SYMBOL(kvfree_sensitive);
security/keys/keyctl.c: kvfree_sensitive(payload, plen);
security/keys/keyctl.c: kvfree_sensitive(payload, plen);
security/keys/keyctl.c:                         kvfree_sensitive(key_data, key_data_len);
security/keys/keyctl.c: kvfree_sensitive(key_data, key_data_len);
security/keys/keyctl.c: kvfree_sensitive(payload, plen);


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
